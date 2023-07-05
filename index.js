$(function () {
    console.log('Ready!');

    var hrefLinks = $('div .CardTitle.svelte-1pxl00z a').map(function () {
        return $(this).attr('href');
    }).get();

    for (i = 0; i < hrefLinks.length; i++) {
        hrefLinks[i] = hrefLinks[i].substring(48);

        URL = "https://www.radiofrance.fr/api/v2.1/path?value=/franceinter/podcasts/sur-les-epaules-de-darwin/";
        hrefLinks[i] = URL + hrefLinks[i];
        
    }
    console.log(hrefLinks)

    // Convertir le tableau en une chaîne JSON
    var jsonData = JSON.stringify(hrefLinks);

    // Envoyer une requête POST au script PHP
    fetch('index.php', {
    method: 'POST',
    body: jsonData
    })
    .then(response => {
    if (response.ok) {
        console.log('Données transférées avec succès.');
    } else {
        console.error('Erreur lors du transfert des données.');
    }
    })
    .catch(error => {
    console.error('Erreur lors du transfert des données:', error);
    });

})