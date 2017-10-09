import Vue from 'vue/dist/vue.esm'
import moment from 'moment'
import DayScore from './day-score/day-score.vue'


document.addEventListener('DOMContentLoaded', () => {
  window.app = new Vue({
    el: '#main',
    data: {},
    components: {
      'day-score': DayScore
    }
  })
})
