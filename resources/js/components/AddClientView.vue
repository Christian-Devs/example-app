<template>

    <div>
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card shadow-sm my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Add Client</h1>
                                    </div>
                                    <form class="user" @submit.prevent="createClient">
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col">
                                                    <input type="text" class="form-control" id="exampleInputFirstName"
                                                        placeholder="Enter Your First Name" v-model="form.first_name"
                                                        required>
                                                    <small class="text-danger" v-if="errors.first_name">
                                                        {{ errors.first_name[0] }}
                                                    </small>
                                                </div>
                                                <div class="col">
                                                    <input type="text" class="form-control" id="exampleInputFirstName"
                                                        placeholder="Enter Your Last Name" v-model="form.last_name"
                                                        required>
                                                    <small class="text-danger" v-if="errors.last_name">
                                                        {{ errors.last_name[0] }}
                                                    </small>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col">
                                                    <input type="tel" class="form-control" id="exampleInputFirstName"
                                                        placeholder="Enter Your First Name" v-model="form.id_number"
                                                        required>
                                                    <small class="text-danger" v-if="errors.id_number">
                                                        {{ errors.id_number[0] }}
                                                    </small>
                                                </div>
                                                <div class="col">
                                                    <input type="date" class="form-control" id="exampleInputFirstName"
                                                        placeholder="Enter Your Last Name" v-model="form.date_of_birth"
                                                        required>
                                                    <small class="text-danger" v-if="errors.date_of_birth">
                                                        {{ errors.date_of_birth[0] }}
                                                    </small>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col">
                                                    <input type="email" class="form-control" id="exampleInputEmail"
                                                        aria-describedby="emailHelp" placeholder="Enter Email Address"
                                                        v-model="form.email" required>
                                                    <small class="text-danger" v-if="errors.email">
                                                        {{ errors.email[0] }}
                                                    </small>
                                                </div>
                                                <div class="col">
                                                    <input type="tel" class="form-control" id="exampleInputPhone"
                                                        aria-describedby="emailHelp"
                                                        placeholder="Enter Telephone Number" v-model="form.telephone"
                                                        required>
                                                    <small class="text-danger" v-if="errors.telephone">
                                                        {{ errors.telephone[0] }}
                                                    </small>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">Add Client</button>
                                        </div>

                                    </form>
                                    <div class="text-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</template>



<script type="text/javascript">


export default {
    created() {
        if (!User.loggedIn()) {
            this.$router.push({ name: '/' })
        }
    },

    data() {
        return {
            form: {
                first_name: null,
                last_name: null,
                telephone: null,
                email: null,
                id_number: null,
                date_of_birth: null
            },
            errors: {}
        }
    },
    methods: {
        createClient() {
            axios.post('/api/auth/signup', this.form)
                .then(res => {
                    User.responseAfterLogin(res)
                    Toast.fire({
                        icon: 'success',
                        title: 'Client added successfully!'
                    })
                    this.$router.push({ name: 'home' })
                })

                .catch(error => this.errors = error.response.data.errors)

        }
    }


} 
</script>


<style type="text/css"></style>