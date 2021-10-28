<template>
  <div v-on:mouseover="showDetail" v-on:mouseleave="hideDetail">
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
          <completed-submit v-if="completedModal" @ok="closeCompletedModal">Successfully updated!</completed-submit>
          <input-form @close="switchModal" v-if="modal" :list="list" @submit="updateItem">Edit Item</input-form>
          <b-button variant="outline-danger" @click="switchConfirm"><font-awesome-icon icon="trash-alt" /></b-button>
          <completed-submit v-if="deletedModal" @ok="closeDeletedModal">Successfully deleted!</completed-submit>
          <confirm-modal v-if="confirm" @close="switchConfirm" @ok="deleteItem">Delete Item</confirm-modal>
        </b-button-group>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import { format } from 'date-fns'
  import InputForm from '../modals/InputForm.vue'
  import ConfirmModal from '../modals/ConfirmModal.vue'
  import CompletedSubmit from '../modals/CompletedSubmit.vue'
  export default {
    props: {
      list: {},
      errors: ''
    },
    components: {
      InputForm,
      ConfirmModal,
      CompletedSubmit
    },
    data() {
      return {
        detail: false,
        modal: false,
        confirm: false,
        completedModal: false,
        deletedModal: false,
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
      closeCompletedModal() {
        this.completedModal = false
        this.$router.go({ name: 'ListIndexPage' });
      },
      closeDeletedModal() {
        this.deletedModal = false
        this.$router.go({ name: 'ListIndexPage' });
      },
      updateItem: function() {
        axios
          .patch(`/api/lists/${this.list.id}`, this.list)
          .then(response => {
            this.completedModal = true
            this.modal = false
          })
          .catch(error => {
            console.error(error);
          })
      },
      deleteItem: function() {
        axios
          .delete(`/api/lists/${this.list.id}`, this.list)
          .then(response => {
            this.deletedModal = true
            this.confirm = false
          })
      }
    }
  }
</script>

<style>
</style>