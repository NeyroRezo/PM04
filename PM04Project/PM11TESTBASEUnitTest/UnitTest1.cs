using Master_floor;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Linq;
using TestBasePM04;

namespace PM11TESTBASEUnitTest
{
    [TestClass]
    public class DatabaseTests
    {
        [TestMethod]
        public void CalculateDiscount_ShouldReturnCorrectDiscount()
        {
            var discountCalculator = new DiscountCalculator();

            Assert.AreEqual("0%", discountCalculator.CalculateDiscount(9999));
            Assert.AreEqual("5%", discountCalculator.CalculateDiscount(10000));
            Assert.AreEqual("5%", discountCalculator.CalculateDiscount(49999));
            Assert.AreEqual("10%", discountCalculator.CalculateDiscount(50000));
            Assert.AreEqual("10%", discountCalculator.CalculateDiscount(299999));
            Assert.AreEqual("15%", discountCalculator.CalculateDiscount(300000));
            Assert.AreEqual("0%", discountCalculator.CalculateDiscount(null));
        }

        [TestMethod]
        public void LoadPartners_ShouldReturnCorrectNumberOfPartners()
        {
            using (var db = new TestBaseEntities())
            {
                var partnersCount = db.Partners.Count();

                Assert.IsTrue(partnersCount >= 5, "Должно быть не менее 5 тестовых партнеров в базе");
            }
        }

        [TestMethod]
        public void LoadPurchaseHistory_ShouldReturnPurchasesForPartner()
        {
            using (var db = new TestBaseEntities())
            {
                var partnerId = 1;
                var purchasesCount = db.Partners_product.Count(pp => pp.ID_Partner == partnerId);
                Assert.IsTrue(purchasesCount >= 2, "У партнера с ID=1 должно быть не менее 2 покупок");
            }
        }

        [TestMethod]
        public void AddNewPartner_ShouldIncreasePartnersCount()
        {
            using (var db = new TestBaseEntities())
            {
                var initialCount = db.Partners.Count();
                var newPartner = new Partners
                {
                    Тип_партнера = "ООО",
                    Наименование_партнера = "Тестовый партнер",
                    Директор = "Тестовый директор",
                    Рейтинг = 5
                };
                db.Partners.Add(newPartner);
                db.SaveChanges();
                var newCount = db.Partners.Count();
                db.Partners.Remove(newPartner);
                db.SaveChanges();
                Assert.AreEqual(initialCount + 1, newCount, "Количество партнеров должно увеличиться на 1");
            }
        }

        [TestMethod]
        public void DeletePartner_ShouldRemovePartnerAndRelatedPurchases()
        {
            using (var db = new TestBaseEntities())
            {
                var newPartner = new Partners
                {
                    Тип_партнера = "ООО",
                    Наименование_партнера = "Тестовый партнер для удаления",
                    Директор = "Тестовый директор",
                    Рейтинг = 5
                };
                db.Partners.Add(newPartner);
                db.SaveChanges();
                var purchase = new Partners_product
                {
                    ID_Partner = newPartner.ID,
                    ID_Product = 1,
                    Количество_продукции = 100,
                    Дата_продажи = DateTime.Now
                };
                db.Partners_product.Add(purchase);
                db.SaveChanges();

                var partnerId = newPartner.ID;
                var initialPartnerCount = db.Partners.Count();
                var initialPurchaseCount = db.Partners_product.Count(p => p.ID_Partner == partnerId);
                var partnerToDelete = db.Partners.Find(partnerId);
                var purchasesToDelete = db.Partners_product.Where(p => p.ID_Partner == partnerId).ToList();

                db.Partners_product.RemoveRange(purchasesToDelete);
                db.Partners.Remove(partnerToDelete);
                db.SaveChanges();
                var finalPartnerCount = db.Partners.Count();
                var finalPurchaseCount = db.Partners_product.Count(p => p.ID_Partner == partnerId);

                Assert.AreEqual(initialPartnerCount - 1, finalPartnerCount, "Количество партнеров должно уменьшиться на 1");
                Assert.AreEqual(0, finalPurchaseCount, "Все покупки партнера должны быть удалены");
            }
        }
    }
    public class DiscountCalculator
    {
        public string CalculateDiscount(double? totalPurchases)
        {
            if (!totalPurchases.HasValue || totalPurchases < 10000) return "0%";
            if (totalPurchases < 50000) return "5%";
            if (totalPurchases < 300000) return "10%";
            return "15%";
        }
    }
}
