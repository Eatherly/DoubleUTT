

function checked(checkbox) {
    if ($(checkbox).prop('checked') == true) {
        return $(checkbox).attr("name")

    }
    if ($(checkbox).prop('checked') == false) {
        return "xxx"

    }

}



class Request {

    constructor(Number, searchField, Contract) {
        this.searchField = searchField;
        this.Number = Number;
        this.Contract = Contract;

    }
    ajax_search() {
        let  temporary = this.Contract;
        $.ajax({
            type: "POST",
            url: "request.php",
            data: "contract" + this.Number + "=" + this.searchField + "&work=" + checked("#work") + "&connecting=" + checked("#connecting") + "&disconnected=" + checked("#disconnected"),
            success: function (data) {
                console.log(typeof (data));

                if (data == false) {

                    $('.incorrect' + temporary).css("display", "block");
                } else {
                    console.log(data);
                    $('.incorrect' + temporary).css("display", "none")
                    $("#services").html("    ");
                    $.each(JSON.parse(data), function (key, val) {

                        $("#customer_name").html(val.name_customer);
                        $("#company").html(val.company);
                     /*   $("#number").html(val.number);
                        $("#date").html(val.date_sign);*/
                        $("#services").append(val.number + "    "+ val.date_sign+ "    "  +val.title_service + "    " + val.status + "<br>");
                    })
                    $('.default').css("display", "block");


                }


            }
        });
    }

}





$(document).ready(function () {
    $("#search_contract").keydown(function (event) {

        if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 ||
                (event.keyCode == 65 && event.ctrlKey === true) ||
                (event.keyCode >= 35 && event.keyCode <= 39)) {

            return;
        } else {

            if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                event.preventDefault();
            }
        }
    });





    $("#search_contract_button").click(function () {

        let searchField = $("#search_contract").val();

        let a = new Request("Number", searchField, "Contract");
        a.ajax_search();

        event.preventDefault();
    });


    $("#search_customer_button").click(function () {

        let searchField = $("#search_customer").val();

        let b = new Request("Customer", searchField, 'Customer');
        b.ajax_search();

        event.preventDefault();
    });


});

