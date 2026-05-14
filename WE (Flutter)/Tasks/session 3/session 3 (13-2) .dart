import 'dart:io';

main()
{
  //Prices:
  double priceA=25.5;
  double priceV=30.25;
  double priceC=90.00;
  double priceU=45.75;
  //Discounts:
  double discountA=15;
  double discountV=7.5;
  double discountC=10;
  double discountU=15;

  print("Enter quantity of A?");
  int qA= int.parse(stdin.readLineSync()!);
  print("Enter quantity of V?");
  int qV= int.parse(stdin.readLineSync()!);
  print("Enter quantity of C?");
  int qC= int.parse(stdin.readLineSync()!);
  print("Enter quantity of U?");
  int qU= int.parse(stdin.readLineSync()!);

  double TotalA= priceA * qA;
  double TotalV= priceV * qV;
  double TotalC= priceC * qC;
  double TotalU= priceU * qU;

  print("Total of A Q is $qA is $TotalA and Total After Dicount is ${TotalA = TotalA - (TotalA * discountA / 100)} ");
  print("Total of V Q is $qV is $TotalV ");
  print("Total of C Q is $qC is $TotalC ");
  print("Total of U Q is $qU is $TotalU ");
  //Total Before Discount
  double TotalBefore= TotalA + TotalV + TotalC + TotalU;
  print("Total Price Before Discount= $TotalBefore");
  //Discount Condition:
  if(qA>5)
  {
    TotalA = TotalA - (TotalA * discountA / 100);
  }
  if(qV>5)
  {
    TotalV = TotalV - (TotalV * discountV / 100);
  }
  if(qC>5)
  {
    TotalC = TotalC- (TotalC * discountC / 100);
  }
  if(qU>5)
  {
    TotalU = TotalU - (TotalU * discountU / 100);
  }
  //Total After Discount
  double TotalAfter= TotalA + TotalV + TotalC + TotalU;
  print("Total Price After Discount= $TotalAfter");
}


