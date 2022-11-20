$(document).on 'turbolinks:load', -&gt;
$('[data-provider="summernote"]').each -&gt;
$(this).summernote
height: 300