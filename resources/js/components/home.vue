<template>
    <div class="container-fluid" id="container-wrapper">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Client List</h1>
        </div>
        <br>
        <input type="text" v-model="searchTerm" class="form-control" style="width: 30%;" placeholder="Search Here">
        <br>

        <div class="row">
            <div class="col-lg-12 mb-4">
                <!-- Simple Tables -->
                <div class="card">
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
                            <thead style="background-color: #731f08;" class="text-white">
                                <tr>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="client in filterSearch" :key="client.id">
                                    <td>{{ client.first_name }}</td>
                                    <td>{{ client.last_name }}</td>
                                    <td>{{ client.email_address }}</td>
                                    <td>{{ client.telephone }}</td>
                                    <td><span v-if="client.status == 'active'"
                                            class="badge badge-success">Active</span><span
                                            v-if="client.status == 'inactive'"
                                            class="badge badge-danger">Inactive</span></td>
                                    <td>
                                        <router-link :to="{ name: 'edit-client', params: { id: client.id } }"
                                            class="btn btn-sm btn-primary"
                                            style="margin-right: .5rem;">Edit</router-link>
                                        <a @click="softDelete(client.id)"
                                            class="btn btn-sm btn-danger text-white">Delete</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- Pagination Links -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination p-2">
                                <li v-for="link in clients.links" :key="link.label" class="page-item"
                                    :class="{ 'active': link.active }">
                                    <button class="page-link" v-html="link.label" @click="allClients(link.url)"
                                        :disabled="!link.url || link.active"></button>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class="card-footer"></div>
                </div>
            </div>
        </div>
        <!--Row-->
    </div>
</template>

<script type="text/javascript">
import Swal from 'sweetalert2'


export default {
    created() {
        if (!User.loggedIn()) {
            this.$router.push({ name: '/' })
        }
    },
    data() {
        return {
            clients: [],
            searchTerm: ''
        }
    },
    computed: {
        filterSearch() {
            let clientList = this.clients.data || this.clients;
            return clientList.filter(client => {
                return client.first_name.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
                    client.last_name.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
                    client.email_address.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
                    client.telephone.includes(this.searchTerm)
            })
        }
    },
    methods: {
        async allClients(url = '/api/clients/') {
            try {
                const response = await axios.get(url);
                this.clients = response.data; // Contains data, links, meta
            } catch (error) {
                console.error("There was an error fetching the clients:", error);
            }
        },
        softDelete(id) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    axios.delete(`/api/clients/${id}`)
                        .then(() => {
                            this.allClients();
                            Notification.success('Client deleted successfully');
                        })
                        .catch(error => {
                            console.error("There was an error deleting the client:", error);
                            Notification.error('Failed to delete client');
                        });
                    Swal.fire(
                        'Deleted!',
                        'Client record has been deleted.',
                        'success'
                    )
                }
            })

        }
    },
    created() {
        this.allClients();
    }
}
</script>

<style>
.pagination {
    display: flex;
}

.page-item.active .page-link {
    background: #F5EEE6;
    color: #731f08;
}

.page-link {
    cursor: pointer;
}
</style>