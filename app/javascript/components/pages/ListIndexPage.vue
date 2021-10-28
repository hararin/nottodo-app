<template>
  <div>
    <div class="button-wrapper">
      <b-button pill variant="outline-primary" @click="switchModal">Add Item</b-button>
    </div>
    <message v-if="message" :message="message"></message>
    <input-form @close="switchModal" v-if="modal" :list="list" @submit="createItem">New Item</input-form>
    <completed-submit v-if="completedModal" @ok="closeModal">Successfully created!</completed-submit>
    <carousel :per-page="1" :navigate-to="someLocalProperty" :mouse-drag="true">
      <slide>
        <wrapper :lists="lists">NotToDoLists</wrapper>
      </slide>
      <slide>
        <wrapper :lists="completedLists">completedLists</wrapper>
      </slide>
    </carousel>
  </div>
</template>

<script>
import axios from 'axios';
import { Carousel, Slide } from 'vue-carousel';
import InputForm from '../modules/modals/InputForm.vue'
import Wrapper from '../modules/lists/Wrapper.vue'
import Message from '../modules/messages/Message.vue'
import CompletedSubmit from '../modules/modals/CompletedSubmit.vue'
export default {
  components: {
    InputForm,
    Wrapper,
    Message,
    CompletedSubmit,
    Carousel,
    Slide
  },
  data: function () {
    return {
      lists: {},
      modal: false,
      completedModal: false,
      message: null,
      list: {
        content: "",
        detail: "",
        period: ""
      }
    }
  },
  mounted() {
    axios
      .get('api/lists.json')
      .then(response => (this.lists = response.data))
  },
  computed: {
    completedLists: function() {
      let completedLists = []
      this.lists.forEach(function (list) {
        if (list.period) {
          completedLists.push(list);
        }
      });
      return completedLists.filter(function (list) {
        return list.period < new Date()
      })
    }
  },
  methods: {
    switchModal() {
      this.modal = !this.modal
    },
    closeModal() {
      this.$router.go({ name: 'ListIndexPage' });
      this.completedModal = false
    },
    createItem: function() {
      axios
        .post('/api/lists', this.list)
        .then(response => {
          this.completedModal = true
          this.modal = false
        })
        .catch(error => {
          console.error(error);
        })
    }
  }
}
</script>

<style scoped>
.button-wrapper {
  text-align: center;
}
</style>