<template>
    <div>
        <h1>Welcome to the Home Page</h1>
        <p>This is the main content area of the home page.</p>
    </div>
</template>

<script type="text/javascript">

export default {
    created() {
        if (!User.loggedIn()) {
            this.$router.push({ name: '/' })
        }
    },
}
</script>

<style>
</style>