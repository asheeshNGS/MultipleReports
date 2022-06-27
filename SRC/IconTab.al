table 50125 IconTab
{
    DataClassification = ToBeClassified;

    fields
    {
        field(4; id; code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(1; "Home Logo"; Blob)
        {
            DataClassification = ToBeClassified;
            SubType = Bitmap;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                PictureUpdated := true;
            end;

        }
        field(2; "Phone Logo"; Blob)
        {
            DataClassification = ToBeClassified;
            SubType = Bitmap;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                PictureUpdated := true;
            end;
        }
        field(3; "Email Logo"; Blob)
        {
            DataClassification = ToBeClassified;
            SubType = Bitmap;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                PictureUpdated := true;
            end;
        }

    }

    keys
    {
        key(key1; id)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        PictureUpdated: Boolean;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}