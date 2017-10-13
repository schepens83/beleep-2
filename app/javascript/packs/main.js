import Vue from 'vue/dist/vue.esm'
import DayScore from './day-score/day-score.vue'

// import moment from 'moment';
// Vue.prototype.$moment = moment


document.addEventListener('DOMContentLoaded', () => {
  window.app = new Vue({
    el: '#main',
    data: {},
    components: {
      'day-score': DayScore
    }
  })
})
