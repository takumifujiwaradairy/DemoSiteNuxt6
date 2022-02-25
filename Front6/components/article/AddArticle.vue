<template>
  <div>
    <h1>投稿</h1>
    <div>
      <div>
        <label>タイトル</label>
        <input v-model="title">
      </div>
      <div>
        <label>内容</label>
        <textarea v-model="body"></textarea>
      </div>
      <button @click="post">送信</button>
    </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      title: '',
      body: ''
    }
  },
  methods: {
    post: function() {
      this.$store.dispatch('addArticle', { title: this.title, body: this.body });
      this.title = '',
      this.body = '',
      this.$router.push("/");
    }
  }
}
</script>

<style>

</style>