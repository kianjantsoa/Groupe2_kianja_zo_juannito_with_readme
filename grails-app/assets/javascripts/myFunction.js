function addimg(){
    $('.pImage').append("<div class=\"input-group mt-2\">\n" +
        "                        <div class=\"input-group-prepend\">\n" +
        "                            <div class=\"input-group-text\">upload file</div>\n" +
        "                        </div>\n" +
        "                        <input type=\"file\" name=\"illustration[]\" class=\"form-control\"  >\n" +
        "                        <button onclick=\"removeimg(this)\"  type=\"button\" style=\"background:none; color:red;border:none\"><i class=\"fa fa-minus-square\"></i></button>\n" +
        "                    </div>")
}

function removeimg(e){
    e.parentElement.remove()
}