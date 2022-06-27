report 50135 "Sleek Bill"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'SleekBill.rdl';

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            column(Picture; Picture)
            {

            }
            column(Name; Name)
            {

            }
            column(Address; Address)
            {

            }
            column(Address_2; "Address 2")
            {

            }
            column(City; City)
            {

            }
            column(County; County)
            {

            }
            column(Post_Code; "Post Code")
            {

            }
            column(Phone_No_; "Phone No.")
            {

            }
            column(Fax_No_; "Fax No.")
            {

            }
            column(E_Mail; "E-Mail")
            {

            }
            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                RequestFilterFields = "No.", "Bill-to Customer No.";
                column(Document_Date; "Document Date")
                {

                }
                column(Order_No; "No.")
                {

                }
                column(Bill_to_Name; "Bill-to Name")
                {

                }
                column(Bill_to_Address; "Bill-to Address")
                {

                }
                column(Bill_to_Address_2; "Bill-to Address 2")
                {

                }
                column(Bill_to_City; "Bill-to City")
                {

                }
                column(Bill_to_County; "Bill-to County")
                {

                }
                column(Bill_to_Post_Code; "Bill-to Post Code")
                {

                }
                column(Bill_to_Contact_No_; "Bill-to Contact No.")
                {

                }
                column(Bill_to_Customer_No_; "Bill-to Customer No.")
                {

                }
                column(Ship_to_Name; "Ship-to Name")
                {

                }
                column(Ship_to_Address; "Ship-to Address")
                {

                }
                column(Ship_to_Address_2; "Ship-to Address 2")
                {

                }
                column(Ship_to_County; "Ship-to County")
                {

                }
                column(Ship_to_Post_Code; "Ship-to Post Code")
                {

                }
                column(Salesperson_Code; "Salesperson Code")
                {

                }
                column(Shipment_Method_Code; "Shipment Method Code")
                {

                }
                column(Payment_Terms_Code; "Payment Terms Code")
                {

                }
                // column(Promised_Delivery_Date; "Promised Delivery Date")
                // {

                // }
                column(Due_Date; "Due Date")
                {

                }
                column(Order_Date; "Order Date")
                {

                }
                // column(SalesPersonName; SalesPersonName)
                // {

                // }
                // column(PaymentTermCodeDes; PaymentTermCodeDes)
                // {

                // }
                // column(ShipmentMethodCodeDes; ShipmentMethodCodeDes)
                // {

                // }
                // column(CountryName; CountryName)
                // {

                // }
                column(Shipment_Date; "Shipment Date")
                {

                }
                column(Quote_No_; "Quote No.")
                {

                }

                column(Amount_Including_VAT; "Amount Including VAT")
                {

                }
                column(External_Document_No_; "External Document No.")
                {

                }
                column(Lamount; Lamount)
                {

                }
                column(CurrRate; CurrRate)
                {

                }
                column(Cust_PhoneNo; Cust_PhoneNo)
                {

                }
                column(Cust_Email; Cust_Email)
                {

                }



                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = field("No.");
                    column(No_; "No.")
                    {

                    }
                    column(Description; Description)
                    {

                    }
                    column(Quantity; Quantity)
                    {

                    }
                    column(Unit_Price; "Unit Price")
                    {

                    }
                    column(Unit_of_Measure; "Unit of Measure")
                    {

                    }
                    column(Line_Discount_Amount; "Line Discount Amount")
                    {

                    }
                    column(Line_Amount; "Line Amount")
                    {

                    }
                    column(VAT__; "VAT %")
                    {

                    }
                    column(UnitPriceExtVAT; UnitPriceExtVAT)
                    {

                    }
                    column(Tax; Tax)
                    {

                    }
                    column(LineDiscount; LineDiscount)
                    {

                    }
                    column(TotalUnitPrice; TotalUnitPrice)
                    {

                    }
                    column(TotalTax; TotalTax)
                    {

                    }
                    column(Line_Discount__; "Line Discount %")
                    {

                    }
                    dataitem(IconTab; IconTab)
                    {
                        column(Home_Logo; "Home Logo")
                        {

                        }
                        column(Phone_Logo; "Phone Logo")
                        {

                        }
                        column(Email_Logo; "Email Logo")
                        {

                        }
                    }


                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                        it: Record Item;


                    begin
                        LineDiscount := 0;
                        TotalUnitPrice := 0;
                        it.SetRange("No.", "No.");
                        if it.FindFirst() then begin
                                                   repeat
                                                       UnitPriceExtVAT := it.CalcUnitPriceExclVAT();
                                                       Tax := it."Unit Price" - UnitPriceExtVAT;

                                                       Lamount := Quantity * (UnitPriceExtVAT + Tax);

                                                       LineDiscount := LineDiscount + "Line Discount Amount";
                                                       TotalUnitPrice := Quantity * UnitPriceExtVAT;
                                                       TotalTax := Quantity * Tax;
                                                   until it.Next() = 0;
                        end;



                    end;

                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                    cr: Record "Currency Exchange Rate";
                    cust: Record Customer;
                begin
                    cr.SetRange("Currency Code", "Currency Code");
                    if cr.FindFirst() then begin
                        CurrRate := cr."Relational Exch. Rate Amount" / 100;
                    end;

                    cust.setRange("No.", "Bill-to Customer No.");
                    if cust.FindFirst() then begin
                        Cust_PhoneNo := cust."Phone No.";
                        Cust_Email := cust."E-Mail";
                    end;
                end;

            }

        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    var
        myInt: Integer;
        ic: page 30;
        UnitPriceExtVAT: Decimal;
        Tax: Decimal;
        Lamount: Decimal;
        LineDiscount: Decimal;
        TotalUnitPrice: Decimal;
        TotalTax: Decimal;
        CurrRate: Decimal;
        Cust_PhoneNo: Text[20];
        Cust_Email: Text[30];

}