import React from 'react'
import ReactDOM from 'react-dom'

import SignUp from './pages/SignUp'

class App extends React.Component {
  render() {
    return <SignUp />;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.body.appendChild(document.createElement('div')),
  )
})
