//jquery선언
 $(function(){
$("#dataOpen3").click(function(){
    alert("확인");
    $.ajax({ 
        url:"https://apis.data.go.kr/B551011/PhotoGalleryService1/galleryList1?serviceKey=xuwyNPIDwBQmxhbPknOBZEa6BgDf%2B9KOknka3pmwgRl0pveeImW0eiTG8%2B9EwRvePTrHAUPwb8IphaFW3isPJw%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&_type=json",
        type:"get",
        data:{},
        dataType:"json",
        success:function(data){
            alert("성공");
            console.log(data.response.body.items.item);
            console.log(data.response.body.items.item[0].galWebImageUrl);
           

          let imgData = data.response.body.items.item[0].galWebImageUrl;
          let hdata =`<img id="img" src="${imgData}">`;
          $("#txt").html(hdata);

        },
        error:function(){
                alert("실패");
            }
    });
    });
 });//jq