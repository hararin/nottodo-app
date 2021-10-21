<template>
  <div id="overlay" @click.self="$emit('close')">
    <div id="modal">
      <h5>{{ PageTitle }}</h5>
      <p>Are you sure you want to delete this item?</p>
      <div class="button-wrapper">
        <b-button @click="$emit('close')" variant="outline-dark">No</b-button>
        <b-button @click="$emit('ok')" variant="outline-danger">Yes</b-button>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      PageTitle: ""
    }
  }
</script>

<style>
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
#modal {
  z-index: 2;
  width: 50%;
  padding: 1em;
  background: #fff;
}
  h5 {
    text-align: center;
  }
  .button-wrapper {
    text-align: center;
  }
</style>