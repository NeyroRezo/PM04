   M S B A M L   `   `   `  ����G  CTestBasePM04, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:TestBasePM04TestBasePM04  5   	       TestBasePM04.History   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:TestBasePM04     5   	     � Title$4  .История покупок партнера��5   
   $	��450��6+   $	��800��68   .��5	      �  � RowDefinitions 5
   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� -   5         ��Name$ tbPartnerInfo��5      $��0��6+   $��10q�68   $
��Bold"�6D   $��14(�6V   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ dgPurchases��5      $��1��6(   $��10q�65      AutoGenerateColumns .     
IsReadOnly .    Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Продукция��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6X   1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 68   �� *ProductName+6X     5      $ Количество��6%   $	 100 6V   	 69   �� *
Quantity+6V     5      $ Дата продажи��6%   $	 120 6w   	 6;   �� *
SaleDate+
 �� StringFormat$
 {0:dd.MM.yyyy}��6w   5      �� 5   
   -   5        $��Закрыть��5      $��2��6#   $	��100��60   $��10q�6<   $��Right=�6H   6d   5      5      