// Inject bundled Elm app
const ElmBundle = require('./app/Main.elm');
ElmBundle.App.embed(document.getElementById('app'));
