// import React from 'react';
// import ReactDOM from 'react-dom';
// import App from './components/App';
// import './index.css';
// import 'bootstrap/dist/css/bootstrap.css';


// ReactDOM.render(<App />, document.getElementById('root'));

import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import 'bootstrap/dist/css/bootstrap.css';
import './index.css';
// import App from './components/App';
import registerServiceWorker from './registerServiceWorker';
import store from './store';
import App from './containers/app'


ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>, 
  document.getElementById('root')
);

registerServiceWorker();