<header>
    <div class="topbar d-flex align-items-center">
        <nav class="navbar navbar-expand gap-3">
            <div class="mobile-toggle-menu"><i class='bx bx-menu'></i>
            </div>


            <div class="top-menu ms-auto">
                <ul class="navbar-nav align-items-center gap-1">
                    <li class="nav-item mobile-search-icon d-flex d-lg-none" data-bs-toggle="modal"
                        data-bs-target="#SearchModal">
                        <a class="nav-link" href="avascript:;"><i class='bx bx-search'></i>
                        </a>
                    </li>

                    <li class="nav-item dark-mode d-none d-sm-flex">
                        <a class="nav-link dark-mode-icon" href="javascript:;"><i class='bx bx-moon'></i>
                        </a>
                    </li>



                    @php
                        $notifications = auth()->user()->unreadNotifications;
                    @endphp
                    <li class="nav-item dropdown dropdown-large">
                        <a class="nav-link dropdown-toggle dropdown-toggle-nocaret position-relative"
                            href="#" data-bs-toggle="dropdown"><span class="alert-count">{{ count($notifications) }}</span>
                            <i class='bx bx-bell'></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end shadow-lg border-0" style="width: 450px;">
                            <div class="msg-header d-flex align-items-center justify-content-between px-3 py-2 border-bottom">
                                <h6 class="msg-header-title mb-0">Notifications</h6>
                                @if(count($notifications) > 0)
                                <a href="{{ route('instructor.mark.all.notifications.read') }}" class="btn btn-sm btn-link text-decoration-none p-0 text-primary fw-bold" style="font-size: 13px;">Mark all as read</a>
                                @endif
                            </div>
                            <div class="header-notifications-list py-1 custom-scrollbar" style="max-height: 420px; overflow-y: auto;">
                                @forelse($notifications as $notification)
                                @php
                                    $user = \App\Models\User::find($notification->data['user_id'] ?? null);
                                @endphp
                                <div class="position-relative notification-item-wrapper border-bottom-0" id="notif-{{ $notification->id }}">
                                    <a class="dropdown-item d-flex align-items-center py-3 mark-notif-link" 
                                       href="{{ $notification->data['link'] ?? 'javascript:;' }}" 
                                       data-id="{{ $notification->id }}">
                                        <div class="user-online me-3">
                                            <img src="{{ (!empty($user->photo)) ? asset($user->photo) : asset('backend/assets/images/avatars/avatar-1.png') }}" 
                                                 class="msg-avatar" alt="user avatar" style="width: 45px; height: 45px;">
                                        </div>
                                        <div class="flex-grow-1" style="white-space: normal;">
                                            <h6 class="msg-name mb-1">{{ $notification->data['name'] ?? 'System' }}
                                                <span class="msg-time float-end text-muted fw-normal" style="font-size: 11px;">{{ $notification->created_at->diffForHumans() }}</span>
                                            </h6>
                                            <p class="msg-info mb-0 text-secondary" style="font-size: 13px; line-height: 1.5;">{{ $notification->data['message'] }}</p>
                                        </div>
                                    </a>
                                    <!-- Specific Mark as Read Action -->
                                    <button class="btn btn-sm mark-as-read-only position-absolute border-0 text-primary p-0" 
                                            data-id="{{ $notification->id }}" 
                                            title="Mark as read"
                                            style="top: 15px; right: 8px; z-index: 5; background: transparent;">
                                        <i class='bx bx-check-circle fs-5'></i>
                                    </button>
                                </div>
                                @empty
                                    <div class="text-center py-4">
                                        <p class="text-muted mb-0">No new notifications</p>
                                    </div>
                                @endforelse
                            </div>
                        </div>
                    </li>

                    <style>
                        .custom-scrollbar::-webkit-scrollbar { width: 4px; }
                        .custom-scrollbar::-webkit-scrollbar-track { background: #f8f9fa; }
                        .custom-scrollbar::-webkit-scrollbar-thumb { background: #ced4da; border-radius: 10px; }
                        .notification-item-wrapper:hover { background-color: #f8f9fa; }
                        .notification-item-wrapper .mark-as-read-only { opacity: 0; transition: opacity 0.2s; }
                        .notification-item-wrapper:hover .mark-as-read-only { opacity: 1; }
                    </style>

                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            // Click on notification link
                            document.querySelectorAll('.mark-notif-link').forEach(link => {
                                link.addEventListener('click', function(e) {
                                    const id = this.getAttribute('data-id');
                                    fetch(`/instructor/mark-notification-as-read/${id}`);
                                });
                            });

                            // Click on specific mark as read (check icon)
                            document.querySelectorAll('.mark-as-read-only').forEach(btn => {
                                btn.addEventListener('click', function(e) {
                                    e.preventDefault();
                                    e.stopPropagation();
                                    const id = this.getAttribute('data-id');
                                    const item = document.getElementById(`notif-${id}`);
                                    
                                    fetch(`/instructor/mark-notification-as-read/${id}`)
                                        .then(response => response.json())
                                        .then(data => {
                                            if(data.success) {
                                                item.style.height = item.offsetHeight + 'px';
                                                item.style.overflow = 'hidden';
                                                item.style.transition = 'all 0.3s ease';
                                                setTimeout(() => {
                                                    item.style.height = '0';
                                                    item.style.opacity = '0';
                                                    item.style.padding = '0';
                                                }, 10);
                                                
                                                setTimeout(() => {
                                                    item.remove();
                                                    updateAlertCount(-1);
                                                    checkEmpty();
                                                }, 310);
                                            }
                                        });
                                });
                            });

                            function checkEmpty() {
                                if(document.querySelectorAll('.notification-item-wrapper').length === 0) {
                                    const list = document.querySelector('.header-notifications-list');
                                    list.innerHTML = `<div class="text-center py-4"><p class="text-muted mb-0">No new notifications</p></div>`;
                                    document.querySelector('.btn-link')?.remove();
                                }
                            }

                            function updateAlertCount(change) {
                                const countEl = document.querySelector('.alert-count');
                                if(countEl) {
                                    let count = parseInt(countEl.innerText) + change;
                                    countEl.innerText = count >= 0 ? count : 0;
                                }
                            }
                        });
                    </script>
                    <!-- <li class="nav-item dropdown dropdown-large">
                        <a class="nav-link dropdown-toggle dropdown-toggle-nocaret position-relative"
                            href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="alert-count">8</span>
                            <i class='bx bx-shopping-bag'></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                            <a href="javascript:;">
                                <div class="msg-header">
                                    <p class="msg-header-title">My Cart</p>
                                    <p class="msg-header-badge">10 Items</p>
                                </div>
                            </a>
                            <div class="header-message-list">
                                <a class="dropdown-item" href="javascript:;">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="position-relative">
                                            <div class="cart-product rounded-circle bg-light">
                                                <img src="{{asset('backend/assets/images/products/11.png')}}" class=""
                                                    alt="product image">
                                            </div>
                                        </div>
                                        <div class="flex-grow-1">
                                            <h6 class="cart-product-title mb-0">Men White T-Shirt</h6>
                                            <p class="cart-product-price mb-0">1 X $29.00</p>
                                        </div>
                                        <div class="">
                                            <p class="cart-price mb-0">$250</p>
                                        </div>
                                        <div class="cart-product-cancel"><i class="bx bx-x"></i>
                                        </div>
                                    </div>
                                </a>


                            </div>

                        </div>
                    </li> -->
                </ul>
            </div>

            <div class="user-box dropdown px-3">
                <a class="d-flex align-items-center nav-link dropdown-toggle gap-3 dropdown-toggle-nocaret"
                    href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="{{ auth()->user()->photo ? asset(auth()->user()->photo) : asset('backend/assets/images/avatars/avatar-2.png') }}" class="user-img" alt="user avatar">


                    <div class="user-info">
                        <p class="user-name mb-0">{{auth()->user()->name}}</p>
                        <p class="designattion mb-0">{{auth()->user()->role}}</p>
                    </div>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item d-flex align-items-center" href="{{route('instructor.profile')}}"><i
                                class="bx bx-user fs-5"></i><span>Profile</span></a>
                    </li>
                    <li><a class="dropdown-item d-flex align-items-center" href="{{route('instructor.setting')}}"><i
                                class="bx bx-cog fs-5"></i><span>Settings</span></a>
                    </li>

                    <li>
                        <div class="dropdown-divider mb-0"></div>
                    </li>
                    <li>

                        <form method="POST" action="{{ route('instructor.logout') }}">
                            @csrf
                            <button type="submit" class="dropdown-item d-flex align-items-center">
                                <i class="bx bx-log-out-circle"></i>
                                <span>Logout</span>
                            </button>
                        </form>

                    </li>
                </ul>
            </div>

        </nav>
    </div>
</header>
