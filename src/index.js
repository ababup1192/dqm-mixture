import 'bulma/css/bulma.css'
import './main.scss'

import { Elm } from './Main.elm'
const mountNode = document.getElementById('main');

Elm.Main.init({
  node: document.getElementById('main')
});
