import React from 'react'
import ReactDOM from 'react-dom'
import { App } from './containers'
import { BrowserRouter } from 'react-router-dom'

ReactDOM.render(
  <BrowserRouter>
    <App />
  </BrowserRouter>,
  document.getElementById('content')
)
