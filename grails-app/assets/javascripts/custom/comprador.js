$('#languageControl').on('click', function(e) {

  var $menu = $(this).parent('dropdown-menu-custom');
  $menu.addClass('show');

  return false;
});

$('#currencyControl').on('click', function(e) {

  var $menu = $(this).parent('dropdown-menu-custom');
  $menu.addClass('show');

  return false;
});

$("#welcomediv").vegas({
    transition: 'fade',
    slides: [
        { src: "../assets/imgs/sample1.jpg" },
        { src: "../assets/imgs/sample-2.jpg" },
        { src: "../assets/imgs/sample3.jpg" },
        { src: "../assets/imgs/sample4.jpg" }
    ]
});
