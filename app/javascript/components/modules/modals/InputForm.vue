<template>
  <div id="overlay" @click.self="$emit('close')">
    <div id="form">
      <b-form @submit.prevent="$emit('submit')">
        <h5>{{ PageTitle }}</h5>
        <b-form-group
          id="input-group-1"
          label="title"
          label-for="input-1"
        >
          <b-form-input
            id="input-1"
            v-model="list.content"
            type="text"
            placeholder="Enter title"
            required
          ></b-form-input>
        </b-form-group>
        <b-form-group
          id="input-group-2"
          label="content"
          label-for="input-2"
        >
          <b-form-textarea
            id="input-2"
            v-model="list.detail"
            type="text"
            placeholder="Enter content"
            required
          ></b-form-textarea>
        </b-form-group>
        <b-form-group
          id="input-group-3"
          label="period"
          label-for="input-3"
        >
          <b-form-datepicker
            id="input-3"
            v-model="list.period"
            type="date"
            placeholder="No date selected"
          ></b-form-datepicker>
        </b-form-group>
        <div class="button-wrapper">
          <b-button type="submit" pill variant="outline-success">Submit</b-button>
        </div>
      </b-form>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      list: {},
      PageTitle: ""
    }
  }
</script>

<style>
h5 {
  text-align: center;
}
#overlay {
  display: flex;
  align-items: center;
  justify-content: center;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
}
#form {
  z-index: 2;
  width: 50%;
  padding: 1em;
  background: #fff;
}
.button-wrapper {
  text-align: center;
}
</style>