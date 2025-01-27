// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers" 
import Vue from 'vue'
console.log('testeee')

new Vue({
  el: '#app',
  data: {
    message: 'Hello, Vue!'
  },
  mounted() {
    console.log('Vue foi montado com sucesso!')
  }
})

