import Vue from 'vue/dist/vue.esm'
import moment from 'moment'
import Calculator from './calculator.vue'
import AppCanvas from './canvas-main.vue'
import ToDo from './todo.vue'
import DayScore from './day-score/day-score.vue'


document.addEventListener('DOMContentLoaded', () => {
  window.app = new Vue({
    el: '#main',
    data: {},
    components: {
      Calculator,
      "app-canvas": AppCanvas,
      'to-do': ToDo,
      'day-score': DayScore
    }
  })
})
