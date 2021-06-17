document.getElementById("btnTel").addEventListener("click", function(){
    let form = document.getElementById('form1');
    let formData = new FormData(form);

    fetch("traitement.php", { method: "POST", body: formData })
    .then(response => response.text())
    .then(data => {
        console.log(data);
    }); 
})