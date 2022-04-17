import Vue from 'vue'
import App from './App.vue'
import store from './store'
import { BootstrapVue } from 'bootstrap-vue'
import VueRouter from 'vue-router'

// Import Bootstrap an BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

import router from './router';

Vue.use(BootstrapVue)
Vue.config.productionTip = false
Vue.use(VueRouter);

new Vue({
  store,
  router,
  render: h => h(App)
}).$mount('#app')
