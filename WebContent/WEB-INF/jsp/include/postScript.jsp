<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
//댓글 입력
$('#comment_write').on('submit', '.inputForm', function(e) {
    e.preventDefault();
    $.ajax({
    	url:'/post/commentInsert',
        data: { boardNo:
        	$(this).data("boardno"), content:$(this).children("textarea").val() },
        success: function() {
        	$(".form-control").val("");
        },
        error:function(textStatus, errorThrown){
               alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
               self.close();
        }
    });
});

//대댓글 입력
	$('#comment_wrap').on('submit', '.reInputForm', function(e) {
	    e.preventDefault();
	   	
	    $.ajax({
	    	url:'/post/reCommentInsert',
	        data: { no:$(this).data("no"), content:$(this).children("input").val(), boardNo:$(this).data("boardno") },
	        success: function() {
	        },
	        error:function(textStatus, errorThrown){
	               alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
	               self.close();
	        }
	    });
	});


//댓글 수정
	$('#comment_wrap').on('submit', '.updateForm', function(e) {
	    e.preventDefault();
	   	alert("수정될 값" + $(this).children("input").val());
	    $.ajax({
	    	url:'/post/commentUpdate',
	        data: { data, content:$(this).children("input").val() },
	        success: function() {
	        },
	        error:function(textStatus, errorThrown){
	               alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
	               self.close();
	        }
	    });
	});

// 댓글 삭제
    $('#comment_wrap').on('submit', '.deleteForm', function(e) {
        e.preventDefault();
        if (confirm("삭제하시겠습니까?")) {
	        $(this).parent().parent().remove();
	        $.ajax({
	        	url:'/post/commentDelete',
	            data: { no:$(this).data("no"), orderNo:$(this).data("orderno") },
	            success: function() {
	            },
	            error:function(textStatus, errorThrown){
	                   alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
	                   self.close();
		        }
	        });
        } //confirm()
    });
    
// 댓글 더보기		
	var $more = $("#more");
    var p = 2;
    
	$("#more").click(function(){
		$('#loadingImg').fadeIn(400);
		$.ajax({
			url:'/post/commentSelect',
			type:'GET',
			data:{p:p, boardNo:${post.no}},
			success:function(data){
				$('#loadingImg').fadeOut(400);
				if(data.length <= 0){
					alert("댓글이 없습니다.");
					$("#more").fadeOut(100);
				} else {
					 p+=1;
					 for (var i = 0; i < data.length; i++){ 
						 $('#comment_wrap').append("<div class='comment_box'>"+"<img src='/user/img/"+data[i].user.profileWithDefault +"'><p>"+ data[i].content+'</p></div>');
					 }
				}
			},
			error:function(textStatus, errorThrown){
				$('#loadingImg').fadeOut(400);
                  alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
                  self.close();
           }
		});
	});
	
// 추천		
var likeCheck = ${likeCheck};

	$("#good_box").on('click', '#good', function() {
        
		$('#good').css('color',likeCheck?'black':'red');
		likeCheck = !likeCheck;

        $.ajax({
            url:'/post/like' ,
            type:'GET' ,
            data:{boardNo:${post.no}} ,
            success:function(data){
                $('#good_box>span').text(data);
            },
            error:function(textStatus, errorThrown){
                alert("에러 발생 \n" + textStatus + " : " + errorThrown);
                self.close();
            }
        }) 
    });
   
// 페럴렉스
	var window = $(window);
	$(window).scroll(function() {
		if ($(window).scrollTop() / 2 < 500) {
			$('.parallex').css('top', $(window).scrollTop() / 2);
		} //if
	});
	
	
//대댓글 불러오기
	$.ajax({
		url:'/post/reCommentSelect',
		type:'GET',
		data:no:/* 불러올 대댓글의 부모 no */,
		success:function(data){
			//불러온 값들 처리방법
		},
		error:function(textStatus, errorThrown){
              alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
              self.close();
       }
	});
	
</script>