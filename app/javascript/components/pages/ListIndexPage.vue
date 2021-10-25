<template>
  <div>
    <div class="button-wrapper">
      <b-button pill variant="outline-primary" @click="switchModal">Add Item</b-button>
    </div>
    <input-form @close="switchModal" v-if="modal" :PageTitle="title" :list="list" @submit="createItem">
    </input-form>
    <wrapper :lists="lists">NotToDoLists</wrapper>
    <wrapper :lists="lists">CompletedLists</wrapper>
  </div>
</template>

<script>
import axios from 'axios';
import InputForm from '../modules/modals/InputForm.vue'
import Wrapper from '../modules/lists/Wrapper.vue'
export default {
  components: {
    InputForm,
    Wrapper
  },
  data: function () {
    return {
      title: "New List",
      lists: {},
      modal: false,
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
  // computed: {
  //   completedLists: function() {
  //     return this.lists.filter(function (list) {
  //       return list.period < new Date()
  //     })
  //   }
  // },
  methods: {
    switchModal() {
      this.modal = !this.modal
    },
    createItem: function() {
      axios
        .post('/api/lists', this.list)
        .then(response => {
          this.$router.go({ name: 'ListIndexPage' });
          this.closeModal();
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
h3 {
  color: #2F4F4F;
  border-bottom: 2px solid #2F4F4F;
}
</style>