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
                                        <h1 class="h4 text-gray-900 mb-4">Edit Client</h1>
                                    </div>
                                    <form class="user" @submit.prevent="updateClient">
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
                                                <div class="col">
                                                    <select class="form-control" v-model="form.status" required>
                                                        <option value="" disabled selected>Select Status</option>
                                                        <option value="active">Active</option>
                                                        <option value="inactive">Inactive</option>
                                                    </select>
                                                    <small class="text-danger" v-if="errors.status">
                                                        {{ errors.status[0] }}
                                                    </small>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col">
                                                    <input type="tel" class="form-control" id="exampleInputFirstName"
                                                        placeholder="Enter Your ID Number" v-model="form.id_number"
                                                        required>
                                                    <small class="text-danger" v-if="errors.id_number">
                                                        {{ errors.id_number[0] }}
                                                    </small>
                                                </div>
                                                <div class="col">
                                                    <input type="date" class="form-control" id="exampleInputFirstName"
                                                        placeholder="Enter Your Last Name" v-model="form.date_of_birth"
                                                        required>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col">
                                                    <input type="email" class="form-control" id="exampleInputEmail"
                                                        aria-describedby="emailHelp" placeholder="Enter Email Address"
                                                        v-model="form.email_address" required>
                                                    <small class="text-danger" v-if="errors.email_address">
                                                        {{ errors.email_address[0] }}
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
                                            <button type="submit" class="btn btn-primary btn-block">Update
                                                Client</button>
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
                email_address: null,
                id_number: null,
                date_of_birth: null,
                uuid: null,
                status: null
            },
            errors: {}
        }
    },
    created() {
        let clientId = this.$route.params.id;
        axios.get(`/api/clients/${clientId}`)
            .then(({ data }) => (this.form = data))
            .catch(error => {
                console.error('Error fetching client data:', error);
            });
    },
    methods: {
        updateClient() {
            let clientId = this.$route.params.id;
            axios.patch(`/api/clients/${clientId}`, this.form)
                .then(() => {
                    this.$router.push({ name: 'home' })
                    Notification.success()
                })
                .catch(error => {
                    if (error.response && error.response.status === 422) {
                        this.errors = error.response.data.errors;
                    } else {
                        console.error('Unexpected error:', error);
                        this.errors = {}; // reset to avoid undefined
                    }
                });

        }
    }


} 
</script>


<style type="text/css"></style>