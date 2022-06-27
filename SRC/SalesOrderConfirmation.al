report 50132 "SO Confirm"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'SOConfir.rdl';


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
            dataitem("Sales Header"; "Sales Header")
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
                column(Promised_Delivery_Date; "Promised Delivery Date")
                {

                }
                column(Due_Date; "Due Date")
                {

                }
                column(SalesPersonName; SalesPersonName)
                {

                }
                column(PaymentTermCodeDes; PaymentTermCodeDes)
                {

                }
                column(ShipmentMethodCodeDes; ShipmentMethodCodeDes)
                {

                }
                column(CountryName; CountryName)
                {

                }
                column(Shipment_Date; "Shipment Date")
                {

                }
                column(Quote_No_; "Quote No.")
                {

                }

                column(Amount_Including_VAT; "Amount Including VAT")
                {

                }
                column(HomePage; HomePage)
                {

                }
                column(PhoneNo; PhoneNo)
                {

                }
                column(Email; Email)
                {

                }
                column(Amount; Amount)
                {

                }
                column(TotalTax; TotalTax)
                {

                }



                dataitem("Sales Line"; "Sales Line")
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
                    column(Purchase_Order_No_; "Purchase Order No.")
                    {

                    }
                    column(totaldiscount; totaldiscount)
                    {

                    }


                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                        it: Record Item;
                        sh: Record "Sales Header";
                        sl: Record "Sales Line";
                    begin
                        // totaldiscount := 0;

                        // SetRange("Document No.", "No.");
                        // if true then begin
                        //     totaldiscount := "Line Discount Amount" + totaldiscount;
                        // end;
                    end;

                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                    sp: Record "Salesperson/Purchaser";
                    pt: Record "Payment Terms";
                    sm: Record "Shipment Method";
                    cr: Record "Country/Region";
                    cust: Record Customer;
                begin
                    sp.SetRange(Code, "Salesperson Code");
                    if sp.FindFirst() then begin
                        SalesPersonName := sp.Name;
                    end;

                    pt.SetRange(Code, "Payment Terms Code");
                    if pt.FindFirst() then begin
                        PaymentTermCodeDes := pt.Description;
                    end;

                    sm.SetRange(Code, "Shipment Method Code");
                    if sm.FindFirst() then begin
                        ShipmentMethodCodeDes := pt.Description;
                    end;

                    cr.setRange(Code, "Bill-to Country/Region Code");
                    if cr.FindFirst() then begin
                        CountryName := cr.Name;
                    end;


                    cust.setRange("No.", "Bill-to Customer No.");
                    if cust.FindFirst() then begin
                        HomePage := cust."Home Page";
                        PhoneNo := cust."Phone No.";
                        Email := cust."E-Mail";
                    end;

                    TotalTax := "Amount Including VAT" - Amount;


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
        SalesPersonName: Text[20];
        PaymentTermCodeDes: Text[20];
        ShipmentMethodCodeDes: Text[20];
        CountryName: Text[20];

        totaldiscount: Decimal;
        HomePage: Text[50];
        PhoneNo: Text[20];
        Email: Text[30];
        TotalTax: Decimal;


}