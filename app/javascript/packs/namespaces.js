import Vue from 'vue'
import Vuetify from 'vuetify'
import App from '../app.vue'
import TurbolinksAdapter from 'vue-turbolinks';

Vue.use(Vuetify)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
});
