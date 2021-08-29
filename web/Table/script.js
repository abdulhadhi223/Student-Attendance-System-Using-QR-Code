$(document).ready(function () {
    //Only needed for the filename of export files.
    //Normally set in the title tag of your page.
    document.title = 'Student Attendance';
    // DataTable initialisation
    $('#example').DataTable(
            {
                "dom": '<"dt-buttons"Bfli>rtp',
                "paging": false,
                "autoWidth": true,
                "fixedHeader": true,
                "buttons": [
                    'colvis',
                    'copyHtml5',
                    'csvHtml5',
                    'excelHtml5',
                    'pdfHtml5',
                    'print'
                ]
            }
    );
});