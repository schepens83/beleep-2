

<template>
  <div class="row">
    <h1>Day Scores</h1>

    <div class="col-xs-12 table-responsive" id="day-scores">
      <table class="table table-condensed">
        <thead>
          <tr>
            <th>Date</th>
            <th>Tension</th>
            <th>Sleep</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <input type="date" v-model="score.day" @keydown.enter="addScore"><br>
              <span style="color:red">{{ errors.day }}</span>
            </td>
            <td>
              <input type="range" min="0" max="10" v-model="score.tension" @keydown.enter="addScore">{{ score.tension }}<br>
              <span style="color:red">{{ tension_error }}</span>
            </td>
            <td>
              <input type="range" min="0" max="10" v-model="score.sleep" @keydown.enter="addScore">{{ score.sleep }}<br>
              <span style="color:red">{{ sleep_error }}</span>
            </td>
            <td><button class="btn btn-primary" v-on:click.prevent="addScore()">Add Score</button></td>
          </tr>

          <tr is="day-score-row" v-for="score in day_scores" :score="score">
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>


<script>
import moment from 'moment'
import DayScoreRow from './day-score-row.vue'

export default {
  data: function () {
    return {
      day_scores: [],
      score: {
        day: moment().format('YYYY-MM-DD'),
        tension: '',
        sleep: ''
      },
      errors: {}
    }
  },

  methods: {
    addScore: function() {
      var that = this;
      $.ajax({
        method: 'POST',

        data: {
          day_score: that.score
        },
        url: 'day_scores.json',
        success: function(res) {
          that.errors = {}
          that.score.day = ''
          that.score.tension = ''
          that.score.sleep = ''
          that.day_scores.unshift(res);
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })
    }
  },

  components: {
    'day-score-row': DayScoreRow
  },

  computed: {
    sleep_error: function() {
      if (this.errors.sleep) {
        return this.errors.sleep[0]
      }
    },
    tension_error: function() {
      if (this.errors.tension) {
        return this.errors.tension[0]
      }
    }
  },

  created: function() {
    var that;
    that = this;
    $.ajax({
      url: 'day_scores.json',
      success: function(res) {
        that.day_scores = res
      }
    })
  }
}
</script>
