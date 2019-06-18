import Vue from 'vue/dist/vue.js';
import UsersNewView from '../../views/users/new';

new Vue({
  el: '#users-new-view',
  components: {
      'users-new-view': UsersNewView
  }
});
