<template>
  <div>
    <div class="button-wrapper">
      <b-button pill variant="outline-primary" @click="openModal">Add Item</b-button>
    </div>
    <input-form @close="closeModal" v-if="modal" :PageTitle="title" :list="list" @submit="createItem">
    </input-form>
    <div class="list-item-wrapper">
      <h3>NotToDoLists</h3>
      <div>
        <b-list-group>
          <b-list-group-item v-for="list in lists" :key="list.id">
            <list-detail :list="list"></list-detail>
          </b-list-group-item>
        </b-list-group>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import InputForm from '../modules/modals/InputForm.vue'
import ListDetail from '../modules/child/ListDetail.vue'
export default {
  components: {
    InputForm,
    ListDetail
  },
  data: function () {
    return {
      title: "New List",
      lists: [],
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
  methods: {
    openModal() {
      this.modal = !this.modal
    },
    closeModal() {
      this.modal = false
    },
    createItem: function() {
      axios
        .post('/api/lists', this.list)
        .then(response => {
          this.$router.push({
            name: 'ListIndexPage'
          })
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
.list-item-wrapper {
  margin-top: 20px;
  margin: 0 auto;
  width: 80%;
  max-width: 600px;
}
h3 {
  color: #2F4F4F;
  border-bottom: 2px solid #2F4F4F;
}
</style>