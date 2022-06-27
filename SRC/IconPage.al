page 50133 "Icon Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = IconTab;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(id; rec.id)
                {
                    ApplicationArea = All;
                }
                field("Home Logo"; rec."Home Logo")
                {
                    ApplicationArea = All;


                }
                field("Phone Logo"; rec."Phone Logo")
                {
                    ApplicationArea = All;

                }
                field("Email Logo"; rec."Email Logo")
                {
                    ApplicationArea = All;

                }



            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
        ci: Record "Company Information";
}