<template>
  <div>
    <button @click="addLike(id)">LIKE</button>
    <button @click="deleteLike(id)">DISLIKE</button>
  </div>
</template>

<script>
import { mapActions } from 'vuex';
export default {
  props: ['id'],
  methods: {
    ...mapActions(['addLike', 'deleteLike'])
  }
}
</script>

<style>

</style>