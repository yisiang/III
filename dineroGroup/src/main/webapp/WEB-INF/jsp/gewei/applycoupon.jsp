<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<script>
    $(function(){
        
        var domainName = '/dinero';

        function fetchAllCouponOfUser(){

            $("#couponTableDiv").empty();

            $.ajax({
                type: "GET",
                url: domainName+'/allcoupon',
                dataType:'json',
                success:function(returnData){
                    //console.log(returnData)

                    if(returnData.length === 0){
                        $("#getCouponbtn").after("<h2>無優惠券可套用</h2>")
                        return;
                    }



                    couponTableContent = "<div id='thisdiv'><table border='1' id='thistable'><tr><th>套用</th><th>名稱</th><th>優惠碼</th><th>同時套用</th></tr>";

   
                    var tfToCn = '';

                    $.each(returnData, function(index, element){

                        
                        //console.log(typeof element.concurrency)
                        if(element.concurrency === true){
                            tfToCn = '能';
                        }else if(element.concurrency == false){
                            tfToCn = '否';
                        }

                        var row = '<tr><td> <input type="checkbox" name="selectedcoupon" value="'+element.couponId+'"/> </td>'+
                            '<td>'+ element.couponName+'</td><td>'+element.couponCode+'</td><td>'+tfToCn+'</td></tr></div>';
                        couponTableContent += row;
                        
                    } );
                   
                    couponTableContent += "</table> ";
                    $("#couponTableDiv").append(couponTableContent);
                    $("#thisdiv").append("<button type='button' id='sendSelectedCoupon'>套用</button>")
                    

                },
                error:function(){
                    $("#getCouponbtn").after("<h2>獲取優惠券失敗</h2>")
                }
        })}

      
        

        function sendCouponsToServers(){
            $("#applyreturntable").remove();
            
            //get element of checked ckeckbox
            //console.log($(":checkbox:checked").toArray());
            var checkeElement = $(":checkbox:checked");
            var checkIntArray = [];
            console.log(checkeElement)
            $.each(checkeElement,function(index, element){
                var newNum = parseInt($(this).prop("value"));
                checkIntArray.push(newNum);
            })

            $.ajax({
                url:domainName+'/applycoupon',
                type:'POST',
                dataType: "json",
        	    contentType: "application/json",
                data:JSON.stringify(checkIntArray),
                success:function(returnData){
                    //console.log(returnData)// return Data 是可套用或不可套用的List 最後含布林值

                    let whereIsBoolean  =returnData.length - 1;
                    let canApplyOrNot  = returnData[whereIsBoolean];
                    var tfToCn = '';
                    

                    if(canApplyOrNot){
                        let tableHtml = '<table border="1" id="applyreturntable"><caption>可套用</caption><tr><th>名稱</th><th>優惠碼</th><th>優惠上限</th></tr>';
                            for(let i = 0;i<whereIsBoolean;i++){
                                let thisCoupon= returnData[i];
                                
                                tableHtml += '<td>'+ thisCoupon.couponName+'</td><td>'+thisCoupon.couponCode+'</td><td>'+thisCoupon.maximumDiscountAmount+'</td></tr>'
                            }
                            tableHtml += '</table>';
                            $("#sendSelectedCoupon").after(tableHtml);

                            returnData.pop();
                            console.log(returnData)

                            $.ajax({
                                url:domainName+'/applysuccesscoupon',
                                type:'POST',
                                dataType:'json',
                                contentType:'application/json',
                                data:returnData,
                                success:function(thenextreturndata){
                                    console.log(thenextreturndata);
                                }
                            })

                    }else if(!canApplyOrNot){
                        let tableHtml = '<table border="1" id="applyreturntable"><caption>不可套用</caption><tr><th>名稱</th><th>優惠碼</th><th>同時套用</th></tr>';
                        for(let i = 0;i<whereIsBoolean;i++){

                            let thisCoupon= returnData[i];

                            if(thisCoupon.concurrency === true){
                                tfToCn = '能';
                            }else if(thisCoupon.concurrency == false){
                                tfToCn = '否';
                            }

                            console.log(thisCoupon)
                            
                            tableHtml += '<td>'+ thisCoupon.couponName+'</td><td>'+thisCoupon.couponCode+'</td><td>'+tfToCn+'</td></tr>'
                        }
                        tableHtml += '</table>';
                        $("#sendSelectedCoupon").after(tableHtml);
                    }

                }
            })
            
        }


        $("#getCouponbtn").on("click",fetchAllCouponOfUser)
        $(document).on("click","#sendSelectedCoupon",sendCouponsToServers)
       

    })
</script>
</head>
<body>
    <button id="getCouponbtn">套用優惠券</button>
    <div id="couponTableDiv"></div>
</body>
</html>