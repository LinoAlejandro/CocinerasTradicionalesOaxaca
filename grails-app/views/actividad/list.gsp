<!DOCTYPE html>  113537
<html>
  <head>
    <g:if test="${session.language}">
      <meta name="layout" content="userEnglish"/>
      <title>Activities</title>
    </g:if>
    <g:else >
      <meta name="layout" content="userEspanol"/>
      <title>Lista de actividades</title>
    </g:else>
    <meta charset="utf-8" />
    <asset:stylesheet href="fullcalendar/fullcalendar.css"/>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  </head>
  <body>
    <div class="container-fluid" >
      <div class="row justify-content-center align-items-center" >
        <div class="col-lg-12 text-center"  style="background-color:#5E1240">
          <h1 class="lobster text-light my-5"
          data-aos="zoom-in">Calendario de Actividades</h1>
        </div>
        <div class="col-lg-10 my-5" id="calendarDiv">
          <div class="cabin shadow" id="calendar"
          data-aos="flip-right"></div>
        </div>
      </div>
    </div>

    <asset:javascript src="fullcalendar/lib/moment.min.js" />
    <asset:javascript src="fullcalendar/fullcalendar.js" />
    <asset:javascript src="fullcalendar/locale/es.js" />

    <script type="text/javascript">
      var alternative = true
      $('#calendar').fullCalendar({
        header: {
            left: 'month,agendaWeek,agendaDay',
            center: '',
            right: 'title'
        },
        eventRender: function(eventObj, $el) {
            $el.popover({
              title: eventObj.title,
              content: eventObj.description,
              trigger: 'hover',
              placement: 'top',
              container: 'body',
            });
        },
        theme: 'bootstrap4',
        timeFormat: 'hh(:mm) t',
        locale: 'es',
        eventTextColor: '#fff',
        eventLimit: true, // allow "more" link when too many events
        navLinks: true,
      });
    </script>

    <g:each var="evento" in="${actividades}">
      <script type="text/javascript">
        var event={
          title: '${evento.titulo}',
          start: '${evento.fechaInicio}',
          end: '${evento.fechaFinal}',
          description:'${evento.lugar}',
          color: alternative ?  '#3C1742' : '#7A1854'
        }
        $('#calendar').fullCalendar( 'renderEvent', event, true);
        alternative = !alternative
      </script>
    </g:each>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <script>
      AOS.init({
        duration: 1200,
      })
    </script>

  </body>
</html>
