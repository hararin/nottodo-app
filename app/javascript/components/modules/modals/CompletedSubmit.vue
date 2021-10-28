<template>
  <div id="overlay">
    <div id="modal">
      <loading v-if="spinnerState" v-on="stopSpinner()"></loading>
      <div v-else>
        <h5><slot></slot></h5>
        <div class="button-wrapper">
          <b-button @click="$emit('ok')" pill variant="outline-success">got it!</b-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Loading from '../modals/Loading.vue'
  export default {
    components: {
      Loading
    },
    data() {
      return {
        spinnerState: true
      }
    },
    methods: {
      stopSpinner() {
        setTimeout(() => {
          this.spinnerState = false;
        }, 2000);
      }
    }
  }
</script>

<style scoped>
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
    color: #2F4F4F;
  }
  .button-wrapper {
    text-align: center;
  }
.spinner {
  text-align: center;
}
</style>