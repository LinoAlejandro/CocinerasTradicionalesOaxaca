<!doctype html>
<html>
<head>
  <meta name="layout" content="userEspanol"/>
  <title>Cocineras Tradicionales</title>
  <asset:stylesheet href="fullcalendar/fullcalendar.css"/>
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
</head>
<body>
  <div class="container-fluid py-5" style="background-color:#D7DEDC">
    <div class="container" >
      <div class="row align-items-center justify-content-center" >
        <div class="col-lg-7 col-md-8" >
          <asset:image src="logo.png" class="img img-responsive img-fluid "/>
        </div>
        <div class="col-lg-7 text-center lobster"
        data-aos="flip-up" >
          <span class="display-4" style="color:#8c001a">
            Cocineras
          </span>
          <span class="display-4" style="color:#5f021f;">
            Tradicionales
          </span>
          <span class="display-4" style="color:#660000">
            de
          </span>
          <span class="display-4" style="color:#7A1854">
            Oaxaca
          </span>
        </div>
      </div>
    </div>
  </div>

  <asset:stylesheet href="custom/index.css"/>

  <div class="container-fluid">
    <div class="row justify-content-center" style="background-color:#28464B">
      <div class="col-lg-12 text-center" >
        <h1 class="lobster text-light my-5"
        data-aos="zoom-in">Noticias</h1>
      </div>
      <div class="col-lg-12">
        <div class="container">
          <div class="">
          </div>
        </div>
          <g:each var="noticia" in="${noticias}">
            <div class="mt-5">
              <div class="">
                <span class="lobster">${noticia.titulo}</span>
                <span class=""><span class="cabin">${noticia.anio}/${noticia.mes}/${noticia.dia}</span></span>
              </div>
              <div class="cabin shadow">
                ${noticia.contenido.size() > 200 ? noticia.contenido.substring(0,200) + "..." : noticia.contenido}
                <div class="m-3 border rounded">
                  <img class="img-fluid" src="${noticia.ubicacionImagen}" alt="">
                </div>
                <div class="m-3">
                  <a class="btn text-light" style="background-color:#28464B">Seguir leyendo</a>
                </div>
              </div>
            </div>
          </g:each>
        </ul>
      </div>
    </div>
  </div>

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

  <asset:javascript src="custom/index.js"/>

</body>
</html>
