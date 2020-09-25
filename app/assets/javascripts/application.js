//= require Chart.min
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require_tree .


$(function () {
  // 画面遷移を検知
　 $(document).on('turbolinks:load', function () {
    if ($('#calendar').length) {

        function Calendar() {
        return $('#calendar').fullCalendar({
        });
        }
        function clearCalendar() {
            $('#calendar').html('');
        }

        $(document).on('turbolinks:load', function () {
            Calendar();
        });
        $(document).on('turbolinks:before-cache', clearCalendar);

          //events: '/events.json', 以下に追加
        $('#calendar').fullCalendar({
            events: 'events.json',
              //カレンダー上部を年月で表示させる
            titleFormat: 'YYYY年 M月',
              //曜日を日本語表示
            dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
              //ボタンのレイアウト
            header: {
                left: '',
                center: 'title',
                right: 'today prev,next'
            },
              //終了時刻がないイベントの表示間隔
            defaultTimedEventDuration: '03:00:00',
            buttonText: {
                prev: '前',
                next: '次',
                prevYear: '前年',
                nextYear: '翌年',
                today: '今日',
                month: '月',
                week: '週',
                day: '日'
            },
            // Drag & Drop & Resize
            editable: true,
            //イベントの時間表示を２４時間に
            timeFormat: "HH:mm",
            //イベントの色を変える
            eventColor: '#87cefa',
            //イベントの文字色を変える
            eventTextColor: '#000000',
            eventRender: function(event, element) {
                element.css("font-size", "0.8em");
                element.css("padding", "5px");
                element.find(".fc-title").append(event.status);
            },
            dayClick : function ( date , jsEvent , view ) {
              $('#inputScheduleForm').modal('show');
              },
        });
    }
});

$(window).scroll(function (){
  $('.fadein').each(function(){
      var elemPos = $(this).offset().top,
          scroll = $(window).scrollTop(),
          windowHeight = $(window).height();
        if (scroll > elemPos - windowHeight + 100){
            $(this).addClass('scrollin');
          }
      });
});
$(window).scroll(function (){
    $('.fadeinleft').each(function(){
      var elemPos = $(this).offset().top,
          scroll = $(window).scrollTop(),
          windowHeight = $(window).height();
        if (scroll > elemPos - windowHeight +100){
            $(this).addClass('scrollin');
          }
      });
  });
$(window).scroll(function (){
  $('.fadeinright').each(function(){
      var elemPos = $(this).offset().top,
          scroll = $(window).scrollTop(),
          windowHeight = $(window).height();
        if (scroll > elemPos - windowHeight + 100){
            $(this).addClass('scrollin');
          }
      });
  });
});
