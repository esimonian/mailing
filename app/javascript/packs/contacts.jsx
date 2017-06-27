import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import _ from 'lodash'

class ContactShow extends React.Component {
  propTypes: {
    first_name: React.PropTypes.string,
    email: React.PropTypes.string,
    address_formatted_address: React.PropTypes.string
  }

  render() {
   return (
     <tr>
       <td data-label="Name">{this.props.first_name}</td>
       <td data-label="Email">{this.props.email}</td>
       <td data-label="Address">{this.props.address_formatted_address}</td>
      </tr>
    )
  }
}

const Contact = props => (
  <table className="responsive-table">
    <thead>
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
      </tr>
    </thead>
    <tbody>
      {props.contacts.map((contact, index) => (
        <ContactShow key={contact.id} 
                     first_name={contact.first_name} 
                     email={contact.email}
                     address_formatted_address={contact.address_formatted_address} 
                     />   
      ))}
    </tbody>
  </table>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('table_container')
  const data = JSON.parse(node.getAttribute('data'))
  ReactDOM.render(
    <Contact {...data} />, node,
  )
})
