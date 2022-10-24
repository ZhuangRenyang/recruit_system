<template>
  <div class="title">
    <div class="title-main">
      <span>{{ title }}</span>
    </div>
  </div>
</template>

<script>
export default {
  name: "Title",
  props: {
    title: String,
  }
};
</script>

<style scoped lang="scss">
.title {
  border-bottom: 2px solid #007b86;
  .title-main {
    width: 110px;
    text-align: center;
    color: #fff;
    background: #007b86;
    padding: 5px 0 1px 0;
    border-radius: 10px 10px 0 0;
    span {
      font-size: 18px;
      font-weight: 600;
      letter-spacing: 3px;
    }
  }
}
</style>