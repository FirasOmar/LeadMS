var UIModals=function(){var n=function(){$(".modal").draggable({handle:".modal-header"})};return{init:function(){n()}}}();jQuery(document).ready(function(){UIModals.init()});

var FormDropzone = function () {


    return {
        //main function to initiate the module
        init: function () {  

            Dropzone.options.myDropzone = {
                dictDefaultMessage: "",
                init: function() {
                    this.on("addedfile", function(file) {
                        // Create the remove button
                        var removeButton = Dropzone.createElement("<a href='javascript:;'' class='btn red btn-sm btn-block'>Remove</a>");
                        
                        // Capture the Dropzone instance as closure.
                        var _this = this;

                        // Listen to the click event
                        removeButton.addEventListener("click", function(e) {
                          // Make sure the button click doesn't submit the form:
                          e.preventDefault();
                          e.stopPropagation();

                          // Remove the file preview.
                          _this.removeFile(file);
                          // If you want to the delete the file on the server as well,
                          // you can do the AJAX request here.
                        });

                        // Add the button to the file preview element.
                        file.previewElement.appendChild(removeButton);
                    });
                }            
            }
        }
    };
}();

jQuery(document).ready(function() {    
   FormDropzone.init();
	 
});


var FormiCheck = function () {
    return {
        //main function to initiate the module
        init: function () {  

            $('.icheck-colors li').click(function() {
              var self = $(this);

              if (!self.hasClass('active')) {
                  self.siblings().removeClass('active');

                var skin = self.closest('.skin'),
                  color = self.attr('class') ? '-' + self.attr('class') : '',
                  colorTmp = skin.data('color') ? '-' + skin.data('color') : '-grey',
                  colorTmp = (colorTmp === '-black' ? '' : colorTmp);

                  checkbox_default = 'icheckbox_minimal',
                  radio_default = 'iradio_minimal',
                  checkbox = 'icheckbox_minimal' + colorTmp,
                  radio = 'iradio_minimal' + colorTmp;

                if (skin.hasClass('skin-square')) {
                  checkbox_default = 'icheckbox_square';
                  radio_default = 'iradio_square';
                  checkbox = 'icheckbox_square' + colorTmp;
                  radio = 'iradio_square'  + colorTmp;
                };

                if (skin.hasClass('skin-flat')) {
                  checkbox_default = 'icheckbox_flat';
                  radio_default = 'iradio_flat';
                  checkbox = 'icheckbox_flat' + colorTmp;
                  radio = 'iradio_flat'  + colorTmp;
                };

                if (skin.hasClass('skin-line')) {
                  checkbox_default = 'icheckbox_line';
                  radio_default = 'iradio_line';
                  checkbox = 'icheckbox_line' + colorTmp;
                  radio = 'iradio_line'  + colorTmp;
                };

                skin.find('.icheck').each(function() {
                  var element = $(this).hasClass('state') ? $(this) : $(this).parent();
                  var element_class = element.attr('class').replace(checkbox, checkbox_default + color).replace(radio, radio_default + color);
                  element.attr('class', element_class);
                });

                skin.data('color', self.attr('class') ? self.attr('class') : 'black');
                self.addClass('active');
              };
            });
        }
    };
}();

jQuery(document).ready(function() {
    FormiCheck.init();
});

 

 
$.fn.select2.defaults.set("theme", "bootstrap");

        var placeholder = "Select a State";

        $(".select2").select2({
            placeholder: placeholder,
            width: "100%"
        });


var ComponentsDropdowns = function () {

	
       
    var handleMultiSelect = function () {
         $('.multi-select').multiSelect({
            selectableOptgroup: true
        });
    }

    return {
        //main function to initiate the module
        init: function () {            
            handleMultiSelect();
        }
    };

}();

jQuery(document).ready(function() {    
   ComponentsDropdowns.init(); 
});
 