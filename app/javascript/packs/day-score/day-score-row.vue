<template>
  <tr v-if="isVisible" class="day-score-row">
    <td>
      <div v-if="editMode">
        <input type="date" v-model="score.day" @keydown.enter="updateScore"><br>
        <span style="color:red">{{ errors.day }}</span>
      </div>
      <div @click="editModeOn" v-else>
        {{ score.day + ' | ' + weekDay }}

      </div>
    </td>

    <td>
      <div v-if="editMode">
        <input type="range" min="0" max="100" v-model="score.tension" @keydown.enter="updateScore"><div class="score-nrs">{{ score.tension }}</div><br>
        <span style="color:red">{{ tension_error }}</span>
      </div>
      <div @click="editModeOn" v-else>
        <div class="score-nrs">{{ parseInt(score.tension) }}</div>
      </div>
    </td>

    <td>
      <div v-if="editMode">
        <input type="range" min="0" max="100" v-model="score.sleep" @keydown.enter="updateScore"><div class="score-nrs">{{ score.sleep }}</div><br>
        <span style="color:red">{{ sleep_error }}</span>
      </div>
      <div @click="editModeOn" v-else>
        <div class="score-nrs">{{ parseInt(score.sleep) }}</div>
      </div>
    </td>

    <button class="btn btn-secondary btn-sm" type="button" v-if="!editMode" v-on:click.prevent="editModeOn()">Edit</button>
    <button class="btn btn-primary btn-sm" type="button" v-if="editMode" v-on:click.prevent="updateScore()">Save</button>
    <button class="btn btn-warning btn-sm" type="button" v-if="editMode" v-on:click.prevent="deleteScore()">Delete</button>
  </tr>
</template>

<script>
// import moment from 'moment'

export default {
  props: {
    score: Object
  },

  data: function () {
    return {
      editMode: false,
      errors: {},
      isVisible: true
    }
  },

  methods: {
    updateScore: function() {
      var that = this;
      $.ajax({
        method: 'PUT',
        data: {
          day_score: that.score
        },
        url: '/day_scores/'+ that.score.id +'.json',
        success: function(res) {
          that.errors = {}
          that.score = res
          that.editMode = false
        },
        error: function (res) {
          that.errors = res.responseJSON.errors
        }
      })
    },
    deleteScore: function() {
      var that = this;
      $.ajax({
        method: 'DELETE',
        data: {
          day_score: that.score
        },
        url: '/day_scores/' + that.score.id + '.json',
        success: function(res) {
          that.isVisible = false;
        }
      })
    },
    editModeOn: function() {
      this.editMode = true
    },
    editModeOff: function() {
      this.editMode = false
    }
  },

  computed: {
    weekDay: function() {
      var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
      var daydate = new Date(this.score.day)
      return days[ daydate.getDay() ]
    },
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
  }
}
</script>
