<template>
  <div v-on:mouseover="showDetail" v-on:mouseleave="hideDetail" class="list-item">
    <div class="d-flex justify-content-between align-items-center">
      <div>
        <strong>{{ list.content }}</strong>
        <b-badge v-if="list.period" variant="primary" pill>{{ list.period }}</b-badge>
        <b-badge v-else variant="info" pill>forever</b-badge>
      </div>
      <div>
        <b-button-group>
          <b-button variant="outline-success" @click="openModal"><font-awesome-icon icon="edit" /></b-button>
          <input-form @close="closeModal" v-if="modal" :PageTitle="title" :list="list" @submit="updateItem">
          </input-form>
          <b-button variant="outline-danger" @click="openConfirm"><font-awesome-icon icon="trash-alt" /></b-button>
          <confirm-modal v-if="confirm" @close="closeConfirm" :PageTitle="confirmation" @ok="deleteItem"></confirm-modal>
        </b-button-group>
      </div>
    </div>
    <div v-if="detail" class="d-flex-none">
      {{ list.detail }}
    </div>
  </div>
</template>

<script>
  import axios from 'axios';
  import InputForm from '../modals/InputForm.vue'
  import ConfirmModal from '../modals/ConfirmModal.vue'
  export default {
    props: {
      list: {},
      errors: ''
    },
    components: {
      InputForm,
      ConfirmModal
    },
    data() {
      return {
        title: "Edit Item",
        confirmation: "Delete Item",
        detail: false,
        modal: false,
        confirm: false
      }
    },
    methods: {
      showDetail() {
        this.detail = true
      },
      hideDetail() {
        this.detail = false
      },
      openModal() {
        this.modal = true
      },
      closeModal() {
        this.modal = false
      },
      openConfirm() {
        this.confirm = true
      },
      closeConfirm() {
        this.confirm = false
      },
      updateItem: function() {
        axios
          .patch(`/api/lists/${this.list.id}`, this.list)
          .then(response => {
            this.$router.go({ name: 'ListIndexPage' });
            this.closeModal();
          })
          .catch(error => {
            console.error(error);
            if (error.response.data && error.response.data.errors) {
              this.errors = error.response.data.errors;
            }
          })
      },
      deleteItem: function() {
        axios
          .delete(`/api/lists/${this.list.id}`, this.list)
          .then(response => {
            this.$router.go({ name: 'ListIndexPage' });
            this.closeConfirm();
          })
      }
    }
  }
</script>

<style>
.list-item {
  color: #333;
}
</style>