

function registerCompany(btn) {
    
   toggleIconChange(btn);
    const formData = new FormData(document.getElementById('companyForm'));
          formData.append('flagPath', document.getElementById('phatCurrentflag').value);
          formData.append('logoPath', document.getElementById('phatCurrentlogo').value);

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '../Controller/company/ControllerRegisterCompany.php', true);
    xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            const response = JSON.parse(this.responseText);
            if(response.status)
                Swal.fire({position: 'top-end', icon: 'success', title: 'Éxito !!', text: response.msg, showConfirmButton: false, timer: 1500 })
                
        }else{
          if (this.status === 403) {
            Swal.fire("Mensaje de error", "No Autorizado.", "error");
        } else {
            Swal.fire("Mensaje de error", this.statusText, "error");
        }
    }
};
xhr.send(formData);
 
  toggleIconRollback(btn);
}


function getCompanyDetails() {
    const companyId = 1;
    const xhr = new XMLHttpRequest();
    const url = `../Controller/company/ControllerEditCompany.php?id=${companyId}`;
    xhr.open('GET', url, true);
     xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            if (response.status) {
                // Rellena los campos del formulario con los detalles de la compañía
                data = response.data;
                    document.getElementById('name').value = data?.name || '';
                    document.getElementById('description').value = data?.description || '';
                    document.getElementById('address').value = data?.address || '';
                    document.getElementById('phone').value = data?.phone || '';
                    document.getElementById('currency').value = data?.currency || '';
                    document.getElementById('email').value = data?.email || '';
                    document.getElementById('ruc').value = data?.ruc || '';
                    document.getElementById('branch').value = data?.branch || '';

                   document.getElementById('phatCurrentflag').value = data?.flag || '';
                   document.getElementById('phatCurrentlogo').value = data?.logo || '';

                    const logoSrc = data?.logo ? 'images/' + data?.logo : '../images/defaulphoto.png';
                    const flagSrc = data?.flag ? 'images/' + data?.flag : '../images/defaulphoto.png';
                    setPreviewImage('logo', 'logoPreview', logoSrc);
                    setPreviewImage('flag', 'flagPreview', flagSrc);
            } else {
                console.log('Error: La compañía no se encontró.');
            }
        }
    };
    xhr.send();
}

function previewImage(input, previewId) {
        var preview = document.getElementById(previewId);
        var file = input.files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        };

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }

    function removeImage(previewId, inputId) {
        var preview = document.getElementById(previewId);
        var input = document.getElementById(inputId);
        preview.src = "";
        input.value = "";
        var value =document.getElementById('phatCurrent'+inputId).value='';
    }





    // Nueva función para establecer la vista previa de la imagen
function setPreviewImage(inputId, previewId, imageUrl) {
    const input = document.getElementById(inputId);
    const preview = document.getElementById(previewId);

    // Verifica si hay una imagen cargada
    if (input && imageUrl) {
        preview.src = imageUrl;
        preview.style.display = 'block';  // Muestra la vista previa
    } else {
        preview.src = '';  // Limpia la vista previa
        preview.style.display = 'none';  // Oculta la vista previa
    }
}