import React, { Component } from 'react'
import { Switch, Route } from 'react-router-dom'
import { Home, Resume } from '../../components'
import './style.43css'

export default class App extends Component {
  render() {
    return (
      <Switch>
        <Route exact path="/" component={Home} />
        <Route path="/resume" component={Resume} />
      </Switch>
    )
  }
}
