<template>
  <div v-on:mouseover="showDetail" v-on:mouseleave="hideDetail" class="list-item">
    <div>
      <strong>{{ list.content }}</strong>
    </div>
    <div v-if="detail" class="d-flex-none">
      <div style="white-space: pre-line;">
        {{ list.detail }}
      </div>
      <div class="d-flex justify-content-between align-items-center">
        <div>
          <b-badge v-if="list.period" variant="info">{{ format(new Date(list.created_at), 'yyyy-MM-dd') }}~{{ list.period }}</b-badge>
          <b-badge v-else variant="info">{{ format(new Date(list.created_at), 'yyyy-MM-dd') }}~forever</b-badge>
        </div>
        <b-button-group>
          <b-button variant="outline-success" @click="switchModal"><font-awesome-icon icon="edit" /></b-button>
          <input-form @close="switchModal" v-if="modal" :PageTitle="title" :list="list" @submit="updateItem">
          </input-form>
          <b-button variant="outline-danger" @click="switchConfirm"><font-awesome-icon icon="trash-alt" /></b-button>
          <confirm-modal v-if="confirm" @close="switchConfirm" :PageTitle="confirmation" @ok="deleteItem"></confirm-modal>
        </b-button-group>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';
  import { format } from 'date-fns'
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
        confirm: false,
        format
      }
    },
    methods: {
      showDetail() {
        this.detail = true
      },
      hideDetail() {
        this.detail = false
      },
      switchModal() {
        this.modal = !this.modal
      },
      switchConfirm() {
        this.confirm = !this.confirm
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